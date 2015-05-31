From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:38:04 +0200
Subject: [Buildroot] [PATCH] package/sconeserver: fix static link with
 openssl
In-Reply-To: <1432995551-11598-1-git-send-email-yann.morin.1998@free.fr>
References: <1432995551-11598-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150531103804.3f9f22a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 30 May 2015 16:19:11 +0200, Yann E. MORIN wrote:
> When linking statically, the order of libraries on the linker command
> line is important, and sconeserver got it wrong.
> 
> Also, isconeserver does not use pkg-config, so it misses the private

        ^^ typo

> libs of -lcrypto, which is linking with -lz.
> 
> Fix that:
>   - add a patch to configure.in to fix the order of libraries;
>   - forcibly pass -lz when lkinking statically with openssl.

                             ^^^ typo

Applied with those two typos fixed. It's really a pity that pkg-config
isn't more widely used :-/ If openssl grows another dependency, we
would have to fix this again...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
