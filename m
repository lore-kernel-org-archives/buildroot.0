From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 11:35:33 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix xtensa uclinux code
 generation
In-Reply-To: <20181107212050.32439-1-jcmvbkbc@gmail.com>
References: <20181107212050.32439-1-jcmvbkbc@gmail.com>
Message-ID: <20181108113533.1f72e417@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

On Wed,  7 Nov 2018 13:20:50 -0800, Max Filippov wrote:
> xtensa-uclinux uses bFLT executable file format that cannot relocate
> fields representing offsets from data to code. C++ objects built as PIC
> use offsets to encode FDE structures. As a result C++ exception handling
> doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
> xtensa-uclinux.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Do we actually support xtensa-uclinux (i.e noMMU Xtensa with BFLT) in
the context of Buildroot ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
