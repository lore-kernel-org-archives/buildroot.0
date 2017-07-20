From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:12:27 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <686a296f-488a-1cb9-cdf0-af949349b7d7@mind.be>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
 <686a296f-488a-1cb9-cdf0-af949349b7d7@mind.be>
Message-ID: <20170720231227.611eb85b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 23:03:34 +0200, Arnout Vandecappelle wrote:
> On 20-07-17 16:35, Wolfgang Grandegger wrote:
> [snip]
> 
>  You forgot:
> > +    This script scans a tree and sanitize ELF files' RPATH found in there.  
>                                             ^s
> > +
> > +    Sanitization behaves the same whatever the kind of the processed tree,
> > +    but the resulting RPATH differs. The rpath sanitization is done using
> > +    "patchelf --make-rpath-relazive".  
>                                   ^t
> 
> [snip]
> > +            for excludepath in ${HOST_EXCLUDEPATHS}; do
> > +                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );  
> 
>  Unneeded ;

Please send follow-up patches. Thanks!

I've applied 1 to 5 and 10 tonight. I won't apply 6 to 9 today, so
there's more time to review/adjust them if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
