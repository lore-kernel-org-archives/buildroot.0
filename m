From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun, 20 Sep 2020 11:18:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/graphicsmagick: remove
 redundant BR2_USE_WCHAR condition
In-Reply-To: <20200919143332.1d21cc2e@windsurf.hq.k.grp>
References: <20200918172135.85009-1-grzegorz@blach.pl>
 <20200918172135.85009-2-grzegorz@blach.pl>
 <20200919143332.1d21cc2e@windsurf.hq.k.grp>
Message-ID: <dbcd34e0-8480-0eb9-123f-d411a2807c5d@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/2020 14:33, Thomas Petazzoni wrote:
> On Fri, 18 Sep 2020 19:21:33 +0200
> Grzegorz Blach <grzegorz@blach.pl> wrote:
> 
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
>> ---
>>   package/graphicsmagick/graphicsmagick.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
>> index ab00ee2c9e..7e71870482 100644
>> --- a/package/graphicsmagick/graphicsmagick.mk
>> +++ b/package/graphicsmagick/graphicsmagick.mk
>> @@ -16,7 +16,7 @@ GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
>>   # 0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
>>   GRAPHICSMAGICK_IGNORE_CVES += CVE-2020-12672
>>   
>> -ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
>> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> 
> In what sense is the BR2_USE_WCHAR dependency redundant ? Redundant
> with what ?

I mean that graphicsmagick supports C++ whenever WCHAR is enabled or 
not.  So BR2_INSTALL_LIBSTDCPP should be the only condition on this line.


> Thanks!
> 
> Thomas
> 
