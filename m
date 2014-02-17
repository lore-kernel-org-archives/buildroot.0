From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 17 Feb 2014 09:07:29 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <20140216204721.GD3417@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>
 <8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>
 <20140216204721.GD3417@free.fr>
Message-ID: <CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 16, 2014 at 9:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-02-16 21:08 +0100, Thomas De Schampheleire spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
>> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> >
>> >Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
>> >external, custom toolchain backend.
>> >
>> >We try to be conservative here, and default to kernel headers 2.6.x.
>> >
>> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> >Cc: Arnout Vandecappelle <arnout@mind.be>
>> >Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>> >---
>> > toolchain/toolchain-external/Config-headers.in | 65 ++++++++++++++++++++++++++
>> > toolchain/toolchain-external/Config.in         |  2 +
>> > 2 files changed, 67 insertions(+)
>> > create mode 100644 toolchain/toolchain-external/Config-headers.in
>> >
>> >diff --git a/toolchain/toolchain-external/Config-headers.in b/toolchain/toolchain-external/Config-headers.in
>> >new file mode 100644
>> >index 0000000..60ac384
>> >--- /dev/null
>> >+++ b/toolchain/toolchain-external/Config-headers.in
>> >@@ -0,0 +1,65 @@
>> >+choice
>> >+    bool "External toolchain kernel headers"
>> >+    depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>> >+    default BR2_TOOLCHAIN_EXTERNAL_HEADERS_REALLY_OLD
>> >+
>>
>> Shouldn't there be a help text explaining what this is used for, so as
>> to remove confusion about the fact that the kernel header version was
>> already chosen when the toolchain was built?
>
> I'm not sure I entirely grok your comment. This choice is only visible
> for external toolchains, not for the internal backend, so there is not
> two choices to set the kernel headers version.

True, but suppose the user did make the externel toolchain himself,
for example with crosstool-ng. While creating the toolchain, he did
get the question of which headers to use already, so he/she may think
'Huh? Why do I have to choose it again, and what will happen if I
select a newer version here?"

>
> However, I can indeed add a help entry like that one:
>
>     help
>       Set to the kernel headers version that were used to build
>       the external toolchain.
>
>       This is used to hide/show some packages that have strict
>       requirements on the version of kernel headers.
>
> What do you think about that? Does it answers your concerns?

Yes, thanks.
Maybe you could also add that if the user is unsure about the exact
version, it's 'safer' to specify an older version than a newer one.
And maybe a way of determining the header version used in a toolchain,
in case the user does not know it.

Best regards,
Thomas
