From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 11:22:39 +0200
Subject: [Buildroot] [PATCH 1/4] sysvinit: reduce number of mkdir calls
 in inittab
In-Reply-To: <20180611060016.20755-2-casantos@datacom.com.br> (Carlos Santos's
 message of "Mon, 11 Jun 2018 03:00:13 -0300")
References: <20180611060016.20755-1-casantos@datacom.com.br>
 <20180611060016.20755-2-casantos@datacom.com.br>
Message-ID: <87muw0740w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > The default sysvinit inittab does two separate mkdir calls to create
 > /dev/pts and /dev/shm. Reduce this to call mkdir only once for both
 > directories.

 > This removes id "si3" but keeps ids "si4".."si9" intact rather than
 > renumbering them. This would just increase the turmoil without any
 > practical effect.

 > Based on commit e9db8122fb, by Florian La Roche <F.LaRoche@pilz.de>.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
