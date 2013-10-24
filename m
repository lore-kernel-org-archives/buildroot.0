From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 24 Oct 2013 12:31:12 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <5175AB06.8090101@mind.be>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
 <5171D63D.7050705@mind.be>
 <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
 <5174D1DE.6000902@mind.be>
 <CANxTyt7JzGaq0pirMDDUrEn_XTUxK-4CbaPP00Rn0O709eL50w@mail.gmail.com>
 <5175AB06.8090101@mind.be>
Message-ID: <CAAXf6LWAmfRswP0oCj--iZ+xxrKCYvYQeODCcaJQFx_d_BraOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 22, 2013 at 11:26 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22/04/13 14:32, Danomi Manchego wrote:
>>
>> On Mon, Apr 22, 2013 at 1:59 AM, Arnout Vandecappelle <arnout@mind.be
>> <mailto:arnout@mind.be>> wrote:
>
> [snip]
>
>>       Actually, after thinking a bit harder about it: the following
>>     should work:
>>
>>     sed -n '/^# Toolchain/,/^# System configuration/' $(BUILDROOT_CONFIG)
>> \
>>              | md5sum -
>>
>>       So there's no need to rename stuff or anything.
>>
>>
>> That would also use the GDB and ECLIPSE lines too.  But then, if it
>> accounts for everything outside of the "%compiler% -v" info (wrappers,
>> C-library), then it's worth it.
>>
>> I suppose that we could drop the these lines with an inverse grep:
>>
>> sed -n '/^# Toolchain/,/^# System configuration/p' .config | \
>>      grep -v -e '^#' -e GDG -e ECLIPSE | \
>>      md5sum
>>
>> Too much?
>
>
>  Too much, yes :-) But perhaps we could change the order of the toolchain
> options.
>

Reviving this thread...
http://lists.busybox.net/pipermail/buildroot/2013-April/070819.html

Is there any specific reason why there was no further evolution on this?

Best regards,
Thomas
