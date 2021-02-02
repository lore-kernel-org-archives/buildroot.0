From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2021 18:59:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: create /var/db/dhcpcd
In-Reply-To: <8cb5000b-fbc0-6230-a12c-4dd974b6e074@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 2 Feb 2021 18:40:22 +0100")
References: <20210201192420.1028680-1-fontaine.fabrice@gmail.com>
 <87r1lyiikr.fsf@dell.be.48ers.dk>
 <8cb5000b-fbc0-6230-a12c-4dd974b6e074@green-communications.fr>
Message-ID: <875z3aic4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 >> > +	mkdir -p $(TARGET_DIR)/var/db/dhcpcd
 >> 
 >> What is stored here? Does it need to persist over reboots? How should a
 >> readonly rootfs be handled? Could we perhaps make it a symlink to /run
 >> or similar?
 >> 

 > It stores DHCP DUID and IPv6 stable privacy secrets.  It must persist
 > over reboots, or the features that need them must be disabled or
 > configured not to.

 > Apparently, dhcpcd is smart enough to detect read only systems and
 > plan accordingly, but i did not test it.

OK, thanks.

-- 
Bye, Peter Korsgaard
