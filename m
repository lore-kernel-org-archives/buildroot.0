From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:18:23 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 properly delete output dir even with write-protected folders
In-Reply-To: <20200719121524.GU18825@scaer>
References: <20200718201836.2408554-1-thomas.petazzoni@bootlin.com>
 <20200718205511.GQ18825@scaer> <20200719121524.GU18825@scaer>
Message-ID: <20200808231823.403e5fa8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Jul 2020 14:15:24 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> We might need to be a little bit more careful, though:
> 
>     def rm_ro(f, p, _):
>         os.chmod(os.path.dirname(p), stat.S_IWRITE)
>         os.chmod(p, stat.S_IWRITE)

Thanks for the suggestion! This didn't work as is, since os.chmod()
sets the permissions, it does not *add* to the existing permissions. So
doing os.chmod(foo, stat.S_IWRITE) makes the "foo" directory only
writable, no longer readable/executable.

So I fixed that, and just sent a v2.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
