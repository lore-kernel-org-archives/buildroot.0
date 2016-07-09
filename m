From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 9 Jul 2016 22:05:51 +0200
Subject: [Buildroot] [Patch v2 2/3] rust-bootstrap: new package
In-Reply-To: <20160709143638.778d7964@itchy>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466797592-5565-3-git-send-email-eric.le.bihan.dev@free.fr>
 <f68bcce5-e616-81fd-e217-7abd07f03017@gmail.com>
 <20160709143638.778d7964@itchy>
Message-ID: <7d0b365c-8694-8c9a-eeef-e526816dc9e5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

Adding the list in Cc

Le 09/07/2016 ? 14:36, Eric Le Bihan a ?crit :
> Hi!
> 
> Le Tue, 5 Jul 2016 11:47:02 +0200,
> Romain Naour <romain.naour@gmail.com> a ?crit :
> 
>> Le 24/06/2016 ? 21:46, Eric Le Bihan a ?crit :
>>> This new package fetches a binary snapshot of the Rust compiler,
>>> suitable for the host, in order to bootstrap the Rust compiler.  
>>
>> There is a way to not use the binary snapshot of the Rust compiler ?
> 
> I do not understand your question. As the Rust compiler is written
> in Rust, a Rust compiler is needed for bootstrapping.

I meant adding a Rust compiler in Buildroot prerequisites.
It make sens to download the Rust compiler in his binary format since it not
available yet in all GNU/Linux distribution.
I don't know mush rust. Actually this is the first time I look at it ;-)

> 
> I'll post a respin of the series bumping Rust to version 1.10.0. In
> this version, bootstrapping is not performed using an "anonymous"
> version of rustc anymore, but with the previous official version (i.e.
> 1.9.0).

ok

> 
>>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>> ---
>>>  package/rust-bootstrap/rust-bootstrap.hash |  3 +++
>>>  package/rust-bootstrap/rust-bootstrap.mk   | 24
>>> ++++++++++++++++++++++++ 2 files changed, 27 insertions(+)
>>>  create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
>>>  create mode 100644 package/rust-bootstrap/rust-bootstrap.mk
>>>
>>> diff --git a/package/rust-bootstrap/rust-bootstrap.hash
>>> b/package/rust-bootstrap/rust-bootstrap.hash new file mode 100644
>>> index 0000000..00f686b
>>> --- /dev/null
>>> +++ b/package/rust-bootstrap/rust-bootstrap.hash
>>> @@ -0,0 +1,3 @@
>>> +# Locally calculated
>>> +sha256
>>> a8ca657d78162a9f0a69a1ec8b0460e97259cdf2e6353ee256ae206876c9637e
>>> rust-stage0-2016-03-18-235d774-linux-x86_64-1273b6b6aed421c9e40c59f366d0df6092ec0397.tar.bz2
>>> +sha256
>>> 36958fcd55387d7b1b86618111fa8660c1d488fe191e85ad9659c6470874322b
>>> rust-stage0-2016-03-18-235d774-linux-i386-0e0e4448b80d0a12b75485795244bb3857a0a7ef.tar.bz2
>>> diff --git a/package/rust-bootstrap/rust-bootstrap.mk
>>> b/package/rust-bootstrap/rust-bootstrap.mk new file mode 100644
>>> index 0000000..9a74c3b --- /dev/null +++
>>> b/package/rust-bootstrap/rust-bootstrap.mk @@ -0,0 +1,24 @@
>>> +################################################################################
>>> +# +# rust-bootstrap +#
>>> +################################################################################
>>> +
>>> +# Taken from src/snapshots.txt
>>> +RUST_BOOTSTRAP_DATE = 2016-03-18
>>> +RUST_BOOTSTRAP_REV = 235d774
>>> +
>>> +ifeq ($(HOSTARCH),x86_64)
>>> +RUST_BOOTSTRAP_HASH = 1273b6b6aed421c9e40c59f366d0df6092ec0397
>>> +else
>>> +RUST_BOOTSTRAP_HASH = 0e0e4448b80d0a12b75485795244bb3857a0a7ef
>>> +endif
>>> +
>>> +RUST_BOOTSTRAP_VERSION =
>>> $(RUST_BOOTSTRAP_DATE)-$(RUST_BOOTSTRAP_REV)-linux-$(HOSTARCH)-$(RUST_BOOTSTRAP_HASH)
>>> +RUST_BOOTSTRAP_SITE =
>>> https://static.rust-lang.org/stage0-snapshots +
>>> +RUST_BOOTSTRAP_SOURCE =
>>> rust-stage0-$(RUST_BOOTSTRAP_VERSION).tar.bz2
>>> +RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT  
>> I guess that is the same license as for the rust package.
> 
> Indeed it is.
>  
>>> +RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT  
>> There is not license files extracted from the archive, so make
>> legal-info doesn't work.
> 
> This should be solved in the respin, where host-rust-bootstrap has
> been reworkded.

Great, thanks!

Best regards,
Romain

> 
> Regards,
> 
