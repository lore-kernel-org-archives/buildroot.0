From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 25 Apr 2011 07:38:11 -0500
Subject: [Buildroot] [PATCH] Install module-init-tools into /sbin
In-Reply-To: <BANLkTikChmpqda8rsYVEuRNfhx5STRs0Pg@mail.gmail.com>
References: <8181b3e96a35f372c8b36ec2dfb1eb2a00ee18ea.1303655867.git.smiley73@users.sourceforge.net>
	<BANLkTikChmpqda8rsYVEuRNfhx5STRs0Pg@mail.gmail.com>
Message-ID: <20110425073811.25634hsxyo6vfauc@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Mike Frysinger <vapier@gentoo.org>:
> On Sun, Apr 24, 2011 at 10:38 AM,  <heiko@zuerker.org> wrote:
>> - ? ? ? --program-transform-name=''
>> + ? ? ? --program-transform-name='' \
>> + ? ? ? --prefix=/usr \
>> + ? ? ? --exec-prefix=
>
> empty exec-prefix is a bit odd ... it should be just "/".  the
> --prefix is also redundant as the common build code already sets
> --prefix=/usr.

If you don't have the exec-prefix empty, then it'll install into e.g.  
//sbin, which just hurts my eyes. ;-)
I could take the "prefix" one out, but I usually prefer having this  
explicitly set when I mess with the eprefix.

This patch also fixes issues with auto-loading of modules. Iptables is  
now happy and the modules for your installed hardware are  
automatically loaded.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
