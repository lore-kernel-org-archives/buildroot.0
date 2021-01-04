From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Date: Mon, 4 Jan 2021 16:42:39 -0300
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: new package
In-Reply-To: <20210102184224.13096374@windsurf>
References: <20201204141737.27942-1-klaus@linux.vnet.ibm.com>
 <20210102184224.13096374@windsurf>
Message-ID: <12678409-b5dc-71fa-f0d1-9caf625f75c5@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 1/2/2021 2:42 PM, Thomas Petazzoni wrote:
> Hello Klaus,
> 
> Thanks for this contribution! I have applied your patch to master, with
> a number of changes. See below for details.

Thanks! Those look good and thank you for taking the time to write down
useful explanations about the changes!

>> +config BR2_PACKAGE_WQY_ZENHEI
>> +	bool "wqy-zenhei (Free Chinese-capable fonts)"
> 
> Changed to:
> 
> 	bool "wqy-zenhei (Free Chinese-capable fonts)"
> 
> Indeed for consistency reason, we try to only use the lower-case
> package name as the short prompt for packags.

I was puzzled by this comment so I looked at the commit and I think you
meant to say that you removed the "(Free Chinese-capable fonts)" from the bool.
That makes sense, thanks!

>> diff --git a/package/wqy-zenhei/wqy-zenhei.hash b/package/wqy-zenhei/wqy-zenhei.hash
>> new file mode 100644
>> index 0000000000..86ae38da4f
>> --- /dev/null
>> +++ b/package/wqy-zenhei/wqy-zenhei.hash
>> @@ -0,0 +1,3 @@
>> +# locally computed sha256 from:
>> +# https://downloads.sourceforge.net/project/wqy/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/wqy-zenhei-0.9.45.tar.gz
> 
> Indicating the URL from which the tarball is downloaded and then the
> hash calculated locally is not very useful. Also, SourceForge provides
> md5 and sha1 hashes, and the hash of the license file was missing. So,
> I've changed to:

I understand the md5 and sha1 hashes that I completely missed, but couldn't decode why the locally computed/calculated
sha256 is not useful.

> 
> +# from https://sourceforge.net/projects/wqy/files/wqy-zenhei/0.9.45%20%28Fighting-state%20RC1%29/
> +md5  4c6c3f4e902dd5ee0a121e8c41d040bd  wqy-zenhei-0.9.45.tar.gz
> +sha1  b86b65d3048ade868fcc89229cfac6baf80a3e54  wqy-zenhei-0.9.45.tar.gz
> +# locally calculated
> +sha256  e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6  wqy-zenhei-0.9.45.tar.gz
> +sha256  871c2a85e6bbf7bec65043820b706a265ed95d4e58c577fbb2c9f60c39c26ca7  COPYING

> 
> Applied with those changes. Thanks!
> 
> Thomas
> 
Thanks again!

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
