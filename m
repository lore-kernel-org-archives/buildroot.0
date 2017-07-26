From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Wed, 26 Jul 2017 12:13:16 +0000
Subject: [Buildroot] [PATCH v1] package/libv4l: no libv4lconvert helper
 support if no fork()
In-Reply-To: <20170726132048.32bf249d@windsurf.lan>
References: <1501064391-32685-1-git-send-email-hugues.fruchet@st.com>
 <1501064391-32685-2-git-send-email-hugues.fruchet@st.com>
 <20170726132048.32bf249d@windsurf.lan>
Message-ID: <889c2456-5e86-c1d1-16aa-5986552aabb9@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

V2 sent, hope this is fine this time.

BR,
Hugues.

On 07/26/2017 01:20 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for picking up my proposal!
> 
> On Wed, 26 Jul 2017 12:19:51 +0200, Hugues Fruchet wrote:
>> Build libv4lconvert helper support only when fork()
>> is available.
>> This fix the build issue reported here:
>> http://lists.buildroot.org/pipermail/buildroot/2017-July/197571.html
> 
> Don't use a mailing list link for references to build failures.
> Instead, you should point to the appropriate build result on
> http://autobuild.buildroot.org
> 
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> I haven't Signed-off-by on this commit, so this shouldn't be there.
> 
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   ...lconvert-helper-support-only-when-fork-is.patch | 101 +++++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>   create mode 100644 package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
>>
>> diff --git a/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch b/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
>> new file mode 100644
>> index 0000000..705dea4
>> --- /dev/null
>> +++ b/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
>> @@ -0,0 +1,101 @@
>> +From 30b3692ccb590407f35b43bbae3e3a4298cdbe52 Mon Sep 17 00:00:00 2001
>> +From: Hugues Fruchet <hugues.fruchet@st.com>
> 
> If you are the author...
> 
>> +Date: Wed, 26 Jul 2017 12:17:08 +0200
>> +Subject: [PATCH 10/10] Build libv4lconvert helper support only when fork() is
>> + available
>> +
>> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
> ... then you should be the first person in the Signed-off-by list. And
> if you keep yourself as the author, then remove my name from the
> Signed-off-by list.
> 
> Signed-off-by is used when:
> 
>   - I am the author (first Signed-off-by)
> 
>   - I am passing the patch (because I'm taking it from another project,
>     or because I'm a maintainer applying the patch contributed by
>     someone else)
> 
> Best regards,
> 
> Thomas
> 
