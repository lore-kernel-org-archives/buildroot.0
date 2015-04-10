From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Apr 2015 23:08:12 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local
 source code
In-Reply-To: <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
References: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
 <20150409221228.GC4192@free.fr>
 <CAB7JjA_Xc3ZCpT8RME2_nPjAGiDmp_k+yYOyvih7Bq9BSuShDA@mail.gmail.com>
Message-ID: <55283BBC.1040708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nicolas,

 [Please don't top-post]

On 10/04/15 00:21, Nicolas Dade wrote:
> Let me explain what led me to allow patches to local source. My local source
> isn't mine. It's an SDK from the vendor of a part I'm using. The vendor is much
> better at hardware than software, and their SDK doesn't build as-is. So I need
> to patch it. I also need to maintain my patches separated from the SDK since the
> vendor publishes updates to their SDK every month or so.
> 
> So what I am doing is having the vendor's SDK source code unzip'ed in one
> directory, and have buildroot use [subtrees of] that directory as the local
> source, patch it with my fixes, and build it.

 Instead of unzipping the source code, leave it as an archive (if it is really a
zipfile instead of a tarball, you'll need to supply custom EXTRACT_CMDS). Then
the patches still are applied. And it gives you much more flexibility to put the

> 
> PS I also thought that not allowing patching only for local sources was a
> strange asymmetry in buildroot. I expected local sources to work the same as
> tarballs.

 We probably should get rid of the 'local' site method, since it is indeed
confusing and serves no purpose as far as I'm concerned.


 Regards,
 Arnout

> It wasn't until I looked into the buildroot make system that I
> realized why my patches weren't getting applied. So if you don't accept this
> patch, at least you might document that local sources cannot be patched in a
> clear way.
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
