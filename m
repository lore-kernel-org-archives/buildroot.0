From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 14 Sep 2013 21:04:58 +0100
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <20130914215506.0602b223@skate>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCPjaxG3=c9Qo1gYCjcCgM8h7r4sV+8x-JtQ0a0DEV7cmw@mail.gmail.com>
 <20130914215506.0602b223@skate>
Message-ID: <CAHt8ZCNJT8gRE2oMB_j8d3w7ZLbV6YK_7rPJTj-bruKS=jVmFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 September 2013 20:55, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sat, 14 Sep 2013 20:39:32 +0100, Simon Dawson wrote:
>> This is my only slight concern. I would personally prefer to see the
>> local.mk mechanism replaced by the new external.mk mechanism; it just
>> feels wrong to have both mechanisms in there.
>
> I tend to agree, but there are some differences between the two
> mechanisms:
>
>  (1) the location/name of local.mk is defined within the .config, while
>  the BR2_EXTERNAL location must be passed as environment variable.
>
>  (2) with the BR2_EXTERNAL mechanism, you _have_ to create a
>  BR2_EXTERNAL/Config.in file (even empty), which is not needed with
>  local.mk when all what you want is to use the OVERRIDE_SRCDIR
>  mechanism.

Hmm, yes. That does complicate the issue somewhat. That suggests to me
that we should either:

* keep both local.mk and external.mk, and just live with the slight
aesthetic niggle
* do away with the external.mk

>  (3) The local.mk is included *before* the package .mk files from
>  Buildroot (so that the <foo>_OVERRIDE_SRCDIR is defined before
>  'foo.mk' is included and calls its generic-package/autotools-package
>  macro), while the external.mk file is included *after* all
>  Buildroot package .mk files.

Is there any particular reason to include external.mk after the
internal Buildroot package .mk files? (Sorry if this has been
explained already somewhere.)

Simon.
