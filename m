From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 11 Dec 2014 10:57:32 +0100
Subject: [Buildroot] [PATCH v2 3/3] fs/rawimg: new rootfs target
In-Reply-To: <20141210180532.GC3926@free.fr>
References: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
 <1418141008-18739-4-git-send-email-kaszak@gmail.com>
 <20141210180532.GC3926@free.fr>
Message-ID: <CABbD_XB6kC7AG9Z4u3AdjfSBzQTrVNvO+D9NtVZpp5kWSqWmig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, list,

We believe this is trying to cover a very specific use-case, and should
> better be done in a post-image script.
>
> Basically, we believe that Buildroot should not try to be too smart
> about the filesystem generation. We offer a set of options to build
> basic filesystem images for basic use-cases, as a mean to get
> kick-started more easily and for simple systems.
>
However, more complex filesystem layouts ought to be outside the scope
> of what Buildroot should try to automate, given the unlimited
> combinations that may exist.
>
OK

Another point in the conclusion was that we should provide some sample
> post-image scripts that users can have a look at to see how to write
> their own.
>

Should I just create a mock-up of this script into the support/scripts
directory or so?
By the way, the build-ext3-img script does something very similar, but
needs root privileges. It also creates a vmx file but no vmdk conversion is
involved, so I think it is broken.

As an aside, I add a personal note that was not discussed yesterday: we
> should document in the manual all of the above.
>
You are right - just the manual seems to follow the development of BR with
some delay :)

Some explanation from my perspective regarding this patch:

I am building BR for various VMs. I use VMware (that's why I sent in
openvmtools obviously), QEMU, KVM and various Cloud providers based on KVM.
I think that BR has a great potential in purpose built VMs (vApps), because
of a few reasons:

- the user is completely in control what runs in his/her VM, this adds
security
- the current VM model is one App per one VM - for which BR is a good
choice as it contains no bloatware like a general purpose Linux distro
- it is sparing with the resources, which means two things: greater VM
density and lower pay-per-go costs in case of hosted VMs (like in Google
Cloud's payment model)

So I started this series, and planned to add at least 2 other
functionalities later:
- build as an OVA file (with the use of host-qemu's "qemu-img convert"
command)
- build directly for Google Cloud Compute Engine, which is a special KVM
(thus QEMU) image

If you guys think, that this could be a fair use-case for BR, I would be
happy to continue to provide patches or post build scripts for at least
these VM formats.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141211/167d025f/attachment.html>
