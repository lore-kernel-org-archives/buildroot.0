From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 14:03:08 +0200
Subject: [Buildroot] [PATCH v2 next] flex: bump version to 2.6.4
In-Reply-To: <20170510113123.36929-1-Vincent.Riera@imgtec.com>
References: <20170510113123.36929-1-Vincent.Riera@imgtec.com>
Message-ID: <20170510140308.3e7041f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 12:31:23 +0100, Vicente Olivert Riera wrote:

> - The sed command over Makefile.in to prevent the flex binary to be
>   built fails, so remove it. Instead, just remove the flex binary and
>   its flex++ symlink using a post-target-install hook.

Have you tried to build this with a noMMU toolchain? I believe it will
fail to build, because the flex program uses fork().

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
