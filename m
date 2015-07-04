From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 04 Jul 2015 08:51:16 +0200
Subject: [Buildroot] [v4 3/4] package/nodejs: Fixes for node-pre-gyp
In-Reply-To: <20150702215402.GJ3838@free.fr>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
 <1435830207-16664-3-git-send-email-martin@barkynet.com>
 <20150702215402.GJ3838@free.fr>
Message-ID: <1435992676.2845.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Martin, all,

On Do, 2015-07-02 at 23:54 +0200, Yann E. MORIN wrote:
> Martin, All,
> 
> On 2015-07-02 10:43 +0100, Martin Bark spake thusly:
> > Many packages use node-pre-gyp as a way of deploying precompiled 
> > binary
> > dependencies with fall back to compilation for other targets. 
> >  Currently
> > installing node modules that use node-pre-gyp can fail to use the 
> > correct
> > binary for the target.  This patch fixes this issue by correctly
> > configuring node-pre-gyp.
> > 
> > Firstly, node-gyp uses the option --arch to determine its target
> > architecture (which is already set correctly), however, node-pre
> > -gyp uses
> > --target-arch.  Without this set node.js packages that uses node
> > -pre-gyp
> > will pick the wrong target architecture.
> > 
> > Secondly, the use of precompiled binary packages is not desirable 
> > due to
> > potential security and licensing issues.  To solve this we use the
> > --build-from-source option to force node-pre-gyp to always build 
> > the C++
> > code.
> > 
> > This patch passes npm_config_target_arch and 
> > npm_config_build_from_source
> > to npm which causes --target-arch and --build-from-source to be 
> > passed to
> > node-pre-gyp.
> > 
> > I have tested this using the node.js package serialport which now
> > successfully builds and runs.
> > 
> > Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> I'm not much of a nodejs guy, so I'd like some feedback from other
> nodejs users. J?rg, maybe?
> 
> Otherwise, the build-form-source chunk looks way better, thanks! :-)
> 
> [really only a code review]
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 

I'm quite a bit busy now and it is beyond me. Perhaps I can give
feedback in a week.

Best regards
J?rg Krause
