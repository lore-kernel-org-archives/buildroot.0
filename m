From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Oct 2013 15:13:46 +0200
Subject: [Buildroot] [PATCH] stress: disable documentation
In-Reply-To: <526907E3.5020409@mind.be>
References: <1382571802-23306-1-git-send-email-arnout@mind.be>
 <CAAXf6LXmuFppc4473+KC73LZmUjgk4h32p9Lx_6hANKmudRdDw@mail.gmail.com>
 <526907E3.5020409@mind.be>
Message-ID: <CAAXf6LWq=8cCaFMggQLJqwuiSHAH3+xE0F6LxGXHCYQNkLHXrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 1:43 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 24/10/13 09:10, Thomas De Schampheleire wrote:
>>> +# Also, disable documentation by undefining makeinfo
>>>   STRESS_CONF_OPT = \
>>> -       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
>>> +       $(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
>>> +       MAKEINFO=:
>>
>>
>> What is the significance of this colon?
>
>
>  It's just an empty command. I could have used 'true' as well. In practice,
> they're the same. However, POSIX defines 'true' to take no arguments, while
> ':' ignores its arguments, so ':' is more pedantically correct.

This is new to me, thanks!

Best regards,
Thomas
