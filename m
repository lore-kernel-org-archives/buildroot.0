From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 09:05:43 +0100
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20190225011003.g7j35hly5bpf2bys@vkochan-ThinkPad-T470p>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
 <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
 <CAMw6YJL9ciuU=tScsbV3rqH1KFd+OaPn6jN+DrUDqTdLizqQCA@mail.gmail.com>
 <20190222212912.727ff0c2@windsurf>
 <20190225011003.g7j35hly5bpf2bys@vkochan-ThinkPad-T470p>
Message-ID: <20190225090543.1e93d3a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon, 25 Feb 2019 03:10:03 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> I think that in case of per-packages parallel build the logs became
> messy and meaningless so I send a patch which allows to do per-package
> logging too:
> 
> 	https://patchwork.ozlabs.org/patch/1047549/
> 
> this is a POC so it just shows the idea.

Thanks for proposing this!

The problem of logging was discussed quite a lot back when I started to
work on per-package directories. I think we investigated overriding the
SHELL variable, but couldn't find an approach that worked properly, but
maybe the approach was different than yours, I need to get back to the
original discussion.

Back then, what we concluded is that people could use the "make
--output-sync=target" option, or "make -Otarget" in short. This option
buffers the output of make on a per-target basis, and displays this
output at once when the target has completed. The advantage is that the
output is no longer garbled, but the drawback is that you don't see
"live" what is happening: if a package takes 20 minutes to build,
during 20 minutes you see nothing, and at the end of the 20 minutes,
you get in one go the full build output of that package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
