From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Aug 2014 21:29:15 +0200
Subject: [Buildroot] [PATCH v2 6/6] gendoc infra: Move the manual-clean
 target outside of the infra
In-Reply-To: <CAAXf6LU25gRFo5TxPKJs5qTk+tjj0zi6j6p7-uZFeWNXF+4A8g@mail.gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-7-git-send-email-s.martin49@gmail.com>
 <CAAXf6LU25gRFo5TxPKJs5qTk+tjj0zi6j6p7-uZFeWNXF+4A8g@mail.gmail.com>
Message-ID: <CAHXCMML7kUdZi1ydZQY9HkwHy8mBkvZrHLrdJbWpZGnrNiSTwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Aug 24, 2014 at 3:06 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1 -> v2:
>> - no change
>> ---
>>  docs/manual/manual.mk | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> index 437eccf..74e591f 100644
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -140,10 +140,12 @@ $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
>>         --dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
>>  $(call GENDOC_INNER,$(pkgname),text,text,text,text)
>>  $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
>> +endef
>> +
>>  clean: $(pkgname)-clean
>> +
>>  $(pkgname)-clean:
>> -       $$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
>> -endef
>> +       $(Q)$(RM) -rf $(BUILD_DIR)/$(pkgname)
>>
>>  MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
>>  $(eval $(call GENDOC))
>> --
>
> This kind of defeats the purpose of having a GENDOC infra: suppose we
> add a new type of document next to 'manual'. In this case, we will
> have to create a new directory docs/XXXX/ and make sure that the
> GENDOC infra moves to another file, say package/pkg-gendoc.mk
> Then, we want XXXX-clean to exist too, which is why it should be within GENDOC.

Got the point!

>
> If we don't care about such a case, then we could also simply remove
> GENDOC and only keep GENDOC_INNER.
> In that case we don't even need $(pkgname).
>

Well, I drop this patch.

> Best regards,
> Thomas

Regards,

-- 
Samuel
