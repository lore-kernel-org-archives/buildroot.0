From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Dec 2013 16:23:54 +0000
Subject: [Buildroot] [PATCH v2] sawman: Link using gcc instead of ld
In-Reply-To: <52B07939.7070202@imgtec.com>
References: <1387296698-27642-1-git-send-email-Vincent.Riera@imgtec.com>
 <52B07939.7070202@imgtec.com>
Message-ID: <52B07A9A.7080801@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/17/2013 04:18 PM, Markos Chandras wrote:
> On 12/17/2013 04:11 PM, Vicente Olivert Riera wrote:
>>   .../sawman-001-link-using-gcc-instead-of-ld.patch  |   11 +++++++++++
>>   1 files changed, 11 insertions(+), 0 deletions(-)
>>   create mode 100644
>> package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
>>
>> diff --git
>> a/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
>> b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
>> new file mode 100644
>> index 0000000..fd1b300
>> --- /dev/null
>> +++ b/package/sawman/sawman-001-link-using-gcc-instead-of-ld.patch
>> @@ -0,0 +1,11 @@
>> +--- SaWMan-1.6.3/rules/libobject.make.orig    2013-12-17
>> 15:54:22.137856874 +0000
>> ++++ SaWMan-1.6.3/rules/libobject.make    2013-12-17
>> 15:54:44.233201909 +0000
>> +@@ -3,7 +3,7 @@
>> +     if test -d $<.tmp; then rmdir $<.tmp; fi
>> +     mkdir $<.tmp
>> +     (cd $<.tmp && $(AR) x ../../$<)
>> +-    $(LD) -o $@ -r $<.tmp/*.o
>> ++    $(CC) -nostdlib -o $@ -r $<.tmp/*.o
>> +     rm -f $<.tmp/*.o && rmdir $<.tmp
>> +
>> + .PHONY: $(LTLIBRARIES:%.la=.libs/%.a)
>>
> Hi,
>
> You need to add your Signed-off-by to the patch file along with a small
> description on what this patch does.
>

Ooops! I forgot it when I changed the patch.

Done. v3 sent.

Thank you very much.

-- 
Vincent
