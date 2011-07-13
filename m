From: Daniel Mack <daniel@zonque.org>
Date: Wed, 13 Jul 2011 16:36:28 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <20110713163105.37f42131@skate>
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 <87mxgifyd1.fsf@macbook.be.48ers.dk>
 <CACTFLAO+rT2UEZ+wJ_8ePQwbbG6m9B4SfPtm8chUzkzS_PoKGw@mail.gmail.com>
 <20110713163105.37f42131@skate>
Message-ID: <CACTFLAOtkXndrv1G6xkKa1K=_J8bGZi3hBHc9TbkWxUpiYJp4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 13, 2011 at 4:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 13 Jul 2011 16:26:22 +0200,
> Daniel Mack <zonque@gmail.com> a ?crit :
>
>> The thing is that I have been teaching new DNS lookup functions to
>> libuClibc which will be built depending on a new config variable
>> switch. The puropose for this is to make connman build in buildroot,
>> and I have it running here already. However, to prevent breakage, I
>> would like to depend on this new uClibc configuration directive, so
>> people can't select the new package unless they have a recent uClibc
>> with this new option selected. How would I do this?
>
> Either we decide that this option doesn't add too much overhead to
> uClibc, and we integrate it to the default uClibc configuration we
> ship. Or, we create yet another toolchain config knob that connman can
> depend on, and which would tune the uClibc configuration when enabled.
>
> What is the binary size impact of having your option enabled in uClibc ?

It adds ~5kb.

Daniel
