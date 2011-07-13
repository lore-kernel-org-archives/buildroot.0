From: Daniel Mack <zonque@gmail.com>
Date: Wed, 13 Jul 2011 16:26:22 +0200
Subject: [Buildroot] Depending on uClibc configuration variables
In-Reply-To: <87mxgifyd1.fsf@macbook.be.48ers.dk>
References: <CACTFLAORWLAkCfzgfMxu_75txKhFiuxNfF4t81nQ5646BMngWw@mail.gmail.com>
 <87mxgifyd1.fsf@macbook.be.48ers.dk>
Message-ID: <CACTFLAO+rT2UEZ+wJ_8ePQwbbG6m9B4SfPtm8chUzkzS_PoKGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 13, 2011 at 9:12 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>
> ?Daniel> Is there a clever way to depend on variables set in the uClibc
> ?Daniel> configuration directly in package Config.in files? Something like
> ?Daniel> UCLIBC_HAS_EPOLL for example?
>
> Unfortunately not. We have tweaked the default uClibc config so that all
> packages should build (or patched packages where needed), so it normally
> shouldn't be needed.
>
> I consider using a custom uClibc configuration an advanced feature,
> where the user is supposed to know what they are doing (tm).

The thing is that I have been teaching new DNS lookup functions to
libuClibc which will be built depending on a new config variable
switch. The puropose for this is to make connman build in buildroot,
and I have it running here already. However, to prevent breakage, I
would like to depend on this new uClibc configuration directive, so
people can't select the new package unless they have a recent uClibc
with this new option selected. How would I do this?


Thanks,
Daniel
