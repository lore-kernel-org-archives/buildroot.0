From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 07:25:57 +0100
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <CABukmmN5UjdWupf_8zuCkx13tuNVFxeD9AOE=cemfQ_Soe1AUQ@mail.gmail.com>
References: <20171214105706.4577-1-aep@exys.org>
 <20171214105706.4577-2-aep@exys.org>
 <20171214162102.25c6d252@windsurf>
 <CABukmmN-WtUiGpUGTWUhPhkFLOaLAgMNfXujMwMUkNB=P8PHQA@mail.gmail.com>
 <041c4908-f28f-f553-9b82-b1b115fd1051@petroprogram.com>
 <CABukmmN5UjdWupf_8zuCkx13tuNVFxeD9AOE=cemfQ_Soe1AUQ@mail.gmail.com>
Message-ID: <20171218072557.169c472e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 17:42:36 +0100, A EP wrote:
> yeah that's intentional. musl doesn't actually have separate libs. the
> empty libraries are just for compatibility.
> 
> i don't think dlopen actually works in static musl, it might just return 0.
> libfuse works fine for me, because it only uses dlopen for exotic modules
> stuff.

Then if you want to be able to have support for libfuse in static
builds in Buildroot, libfuse should only conditionally use dlopen(), if
available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
