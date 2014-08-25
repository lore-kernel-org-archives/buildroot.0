From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Aug 2014 21:23:03 +0200
Subject: [Buildroot] [PATCH v2 5/6] gendoc infra: Remove the manual*
 target from .PHONY
In-Reply-To: <CAAXf6LUpWy6gsh58o4bb-ThnQYvxs=ZEoEO4bdqJACFiHmCk7A@mail.gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-6-git-send-email-s.martin49@gmail.com>
 <CAAXf6LUpWy6gsh58o4bb-ThnQYvxs=ZEoEO4bdqJACFiHmCk7A@mail.gmail.com>
Message-ID: <CAHXCMM+4Gg0QoMxrS-Za+T4dH6mt3x6MqvuWvKE75vzh3_+m8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Aug 24, 2014 at 3:03 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> This is not needed because none of these targets are also the name of a
>> generated file.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1 -> v2:
>> - no change
>> ---
>>  docs/manual/manual.mk | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> index 016246c..437eccf 100644
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -143,7 +143,6 @@ $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
>>  clean: $(pkgname)-clean
>>  $(pkgname)-clean:
>>         $$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
>> -.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
>
> I do not agree with your reasoning that because these targets are not
> a file, PHONY is not needed.
> The same could be said for the
> .PHONY: $(1)-$(3)
> line in GENDOC_INNER, and yet PHONY is not removed there.
>
> From the make manual [1]
>
> "There are two reasons to use a phony target: to avoid a conflict with
> a file of the same name, and to improve performance.
> ...
> Since it knows that phony targets do not name actual files that could
> be remade from other files, make skips the implicit rule search for
> phony targets (see Implicit Rules). This is why declaring a target
> phony is good for performance, even if you are not worried about the
> actual file existing"
>
> So according to me, the PHONY declarations should remain.
>
> In fact, all package infrastructures could use such PHONY
> declarations, but they currently do not have them.
>

Arf! Though I did read this paragraph, I miss the performance point :-s
I drop this patch from the series.

> Best regards,
> Thomas
>
> [1] http://www.gnu.org/software/make/manual/make.html#Phony-Targets

Regards,

-- 
Samuel
