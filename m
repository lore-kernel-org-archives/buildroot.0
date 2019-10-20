From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 19 Oct 2019 23:55:51 -0700
Subject: [Buildroot] [RFC PATCH 1/4] llvm: disable bindings on host
In-Reply-To: <0f630437-4501-2ff6-dae1-f7178e5e91cb@mind.be>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
 <20190724173538.22913-2-joseph.kogut@gmail.com>
 <0f630437-4501-2ff6-dae1-f7178e5e91cb@mind.be>
Message-ID: <CAMWSM7hm-fKZRyZo65=Tg5Z_H+cu_+Xge0=mjnGMvLSjoUrjLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 19, 2019 at 3:47 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/07/2019 19:35, Joseph Kogut wrote:
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>
>  Can you explain why this is needed/wanted?
>
>  Regards,
>  Arnout
>

Nope. This commit was a while ago, and when I was working on this
feature, I found that certain bindings were still enabled which caused
a build failure. I researched the configure flags for LLVM, and found
this one. Enabling it fixed the build, so I added it.

It's very possible the enabling of this flag obviates the need for the
priors. If that's the case, I would of course support removing the
unneeded flags.

Best,
Joseph
