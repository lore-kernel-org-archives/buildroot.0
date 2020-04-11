From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sat, 11 Apr 2020 11:27:30 +0200
Subject: [Buildroot] [PATCH] package/gr-osmosdr: bump to 0.2.0
In-Reply-To: <20200410222349.111429ea@windsurf.home>
References: <20200410150111.15360-1-gwenj@trabucayre.com>
 <20200410222349.111429ea@windsurf.home>
Message-ID: <00f6b096-ab4f-1eb4-c0df-5f1a474e8cae@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/04/2020 22:23, Thomas Petazzoni wrote:
> On Fri, 10 Apr 2020 17:01:11 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
>> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>>
>> Since, gr-osmosdr is python3 only, drop everything related to python2.
>> python-cheetah is no more mandatory, so drop this too.
>>
>> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>> ---
>>   package/gr-osmosdr/Config.in       | 1 +
>>   package/gr-osmosdr/gr-osmosdr.hash | 2 +-
>>   package/gr-osmosdr/gr-osmosdr.mk   | 8 ++++----
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
>> index 1e80137f35..3d12540c7d 100644
>> --- a/package/gr-osmosdr/Config.in
>> +++ b/package/gr-osmosdr/Config.in
>> @@ -1,6 +1,7 @@
>>   config BR2_PACKAGE_GR_OSMOSDR
>>   	bool "gr-osmosdr"
>>   	depends on BR2_PACKAGE_GNURADIO
>> +	depends on BR2_PACKAGE_PYTHON3
> 
> Why do you add this dependency? The package itself only requires
> host-python3, not the target python.
> 
> However, the BR2_PACKAGE_GR_OSMOSDR_PYTHON option would indeed need
> this dependency.
> 
> Am I missing something ?
> 
> Thanks,
> 
> Thomas
> 
No, It's true, this depends must be for BR2_PACKAGE_GR_OSMOSDR_PYTHON
...

Thanks

Gwen
