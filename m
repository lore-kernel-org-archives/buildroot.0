From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 11:01:29 +0100
Subject: [Buildroot] Adding a patch in a different directory
In-Reply-To: <CAHt8ZCMY=kbSmCg8r7BWFZ1GFuXutRjBDov+wWCa_ZGMncUMtg@mail.gmail.com>
References: <CAE21AQoQPni=ck0LN1W=DRRdWWw6jjvFf9dxvX6cK5fmZV_+XQ@mail.gmail.com>
 <CAHt8ZCMY=kbSmCg8r7BWFZ1GFuXutRjBDov+wWCa_ZGMncUMtg@mail.gmail.com>
Message-ID: <20130315110129.2454684f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Fri, 15 Mar 2013 07:30:56 +0000, Simon Dawson wrote:
> On 15 March 2013 00:50, Charles Manning <cdhmanning@gmail.com> wrote:
> > What I would like to do is get buildroot to use the patch in foo/patches.
> >
> > Any ideas how to achieve this?
> 
> I submitted a patch a while ago to add support for custom package patches:
> 
> http://patchwork.ozlabs.org/patch/222260/
> 
> The patch has not been accepted as of this writing, but you can
> achieve your goal by adding something like the following to your
> local.mk

We discussed this at the Buildroot Developers Meeting, and we agreed on
a model for patches, that would apply to both "internal" patches and
"external" patches.

The report of the meeting contains:

"""

Change of the patch logic

 * For the patches stored in the package directory, if
   package/<pkg>/<version>/ does exist, apply
   package/<pkg>/<version>/*.patch, otherwise, apply
   package/<pkg>/*.patch

 * For the patches stored in the global patches directory, if
   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply
   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply
   $(GLOBAL_PATCH_DIR)/<pkg>/*.patch 

"""

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
