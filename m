From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 8 Dec 2014 17:33:13 +0100
Subject: [Buildroot] [PATCH 0/24 v3] ejabberd: XMPP server (branch
	yem/ejabberd)
In-Reply-To: <20141122211947.2d556071@free-electrons.com>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
 <20141122211947.2d556071@free-electrons.com>
Message-ID: <CAJtjsKYdgLhoNujsxrKA1C4yKdvBZFvSfCz-yEC=p7BsPvRy+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas, All,

On Sat, Nov 22, 2014 at 9:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Wed, 12 Nov 2014 01:26:05 +0100, Yann E. MORIN wrote:
>
>> ----------------------------------------------------------------
>> Johan Oudinet (14):
>>       package/pkg-rebar: new infrastructure
>>       erlang-goldrush: new package.
>>       erlang-lager: new package.
>>       erlang-p1-zlib: new package.
>>       erlang-p1-yaml: new package.
>>       erlang-p1-xml: new package.
>>       erlang-p1-utils: new package.
>>       erlang-p1-tls: new package.
>>       erlang-p1-stun: new package.
>>       erlang-p1-stringprep: new package.
>>       erlang-p1-sip: new package.
>>       erlang-p1-iconv: new package.
>>       erlang-p1-cache-tab: new package.
>>       ejabberd: new package.
>>
>> Yann E. MORIN (10):
>>       pkg-autotools: move common macros
>>       pkg-autotools: re-order cleaning up the host dependencies
>>       pkg-autotools: commonalise the libtool patching code
>>       pkg-autotools: move the libtool patching call out of the autoreconf hook
>>       pkg-autotools: remove redundant shell conditional
>>       pkg-autotools: fold the libtool patching code directly into the hook
>>       pkg-autotools: only apply libtool patch at the right moment
>
> I've applied all the pkg-autotools patches of this series. As discussed
> on IRC, I've changed back the authorship of patches 1, 3, 4 to Johan,
> who is actually the author of those patches.
>
> I haven't yet looked at the rest of the series, but at least it's 7
> less patches for you to carry in your branch.

Thanks Thomas for having applied these patches.

I've looked into Yann's branch and made some modifications to fix the
compilation and runtime errors.
I've also find out and fix the issue with erl_interface, which ld does
not find if we compile an erlang library after finalizing make once:
It's because rebar was looking for such libraries in $(TARGET_DIR)
instead of $(STAGING_DIR), and libraries in TARGET_DIR are deleted by
the target-finalize Makefile rule.
How should I share these modifications? I guess I cannot push to
Yann's git repository.
Should I send again a patch series, even though Yann has not finished
its review yet?

Best regards,
-- 
Johan
