From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 20:40:51 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170910181806.GA21464@scaer>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan>
 <20170910092450.GC3536@scaer>
 <cab76ac0-716f-1f50-b04d-bb9caf0d3e94@jikos.cz>
 <20170910181806.GA21464@scaer>
Message-ID: <20170910204051.3db9ec8f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Sep 2017 20:18:06 +0200, Yann E. MORIN wrote:

> Globally, the hash is here for three reasons:
> 
>  1- be sure that what we download is what we expect, to avoid
>     man-in-the-middle attacks, especially on security-sensitive
>     packages: ca-certificates, openssh, dropbear, etc...
> 
>  2- be sure that what we download is what we expect, to avoid silent
>     corruption of the downloaded blob, or to avoid fscked-up by
>     intermediate CDNs (already seen!)
> 
>  3- detect when upstream completely messes up, and redoes a release,
>     like regnerating a release tarball, or re-tagging another commit,
>     after the previous one went public.

I think there is also another reason for the hashes to exist: if you
fetch from a BR2_PRIMARY_SITE or from the BR2_BACKUP_SITE, you're
really fetching tarballs, and not doing git clones. So in this case,
having a hash makes a lot of sense.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
