From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 21:04:37 +0200
Subject: [Buildroot] DNS resolv issue with localhost
In-Reply-To: <4E130353.7030207@labri.fr>
References: <23843298-AAFD-4E03-A77D-2883BBA856B2@labri.fr>
 <4E130353.7030207@labri.fr>
Message-ID: <20110705210437.47fd7806@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 05 Jul 2011 14:28:03 +0200,
Jigar SOLANKI <jigar.solanki@labri.fr> a ?crit :

> Problem SOLVED :
> I was missing the nsswitch.conf file in /etc, so the resolv order was
> wrong (nslookup localhost was requesting the dns server in
> /etc/resolv.conf whereas it should have beeb /etc/hosts)
> I just added a nsswitch.conf from an another correctly running linux.

So you're using a glibc-based system, right ? If so, maybe we should
add this nsswitch.conf file to the default Buildroot and make sure it
gets installed when a glibc toolchain is used.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
