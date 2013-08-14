From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Aug 2013 18:27:58 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] Config.in.legacy: update
	description
In-Reply-To: <520A5F4D.70901@mind.be>
References: <patchbomb.1374650577@BEANTN0L019720>
 <2942a6d3dd9f0f3fd864.1374650578@BEANTN0L019720>
 <520A5F4D.70901@mind.be>
Message-ID: <CAAXf6LWkxErzjf-0nYtO78LqFsnQnTdP6kJrJWGoYpi8AzU1=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2013 at 6:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/07/13 09:22, Thomas De Schampheleire wrote:
> [snip]
>
>> +# If the old symbol is of type string, and the symbol has been renamed,
>> you
>> +# should add it as a bool with another name (BR2_<foo>_WRAP), that
>> defaults
>> +# to y if the old string is not set at its default value. For example:
>> +#     config BR2_FOO_STRING
>> +#             string "Some foo string"
>> +# would become:
>> +#     config BR2_FOO_STRING_WRAP
>> +#             bool "Foo string option has been renamed."
>> +#             default y if BR2_FOO_STRING != ""
>> +#             depends on BR2_LEGACY
>
>
>  My Ack was too hasty, this should be
>         select BR2_LEGACY
>

(ashamed) You're absolutely right...

Thanks for noticing,

Thomas
