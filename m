From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 13 Sep 2016 09:57:00 +0200
Subject: [Buildroot] [PATCH 3/3] package/nginx-naxsi: add missing pcre
	dependency
In-Reply-To: <ce6702df-b7fe-dc20-87cd-366bec948482@mind.be>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-3-s.martin49@gmail.com>
 <ce6702df-b7fe-dc20-87cd-366bec948482@mind.be>
Message-ID: <CAHXCMM+RX=zVG8zqjjW6m9BfuZ_HQwdakcCtBCXEMPJ6qY+-Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 13, 2016 at 8:40 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 12-09-16 21:23, Samuel Martin wrote:
>> Fixes:
>>   http://autobuild.buildroot.net/results/9c7/9c7bad6831b09251af81e2bbfc595a241df87c70/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/nginx-naxsi/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
>> index 2f7c2da..6c175eb 100644
>> --- a/package/nginx-naxsi/Config.in
>> +++ b/package/nginx-naxsi/Config.in
>> @@ -1,5 +1,6 @@
>>  config BR2_PACKAGE_NGINX_NAXSI
>>       bool "nginx-naxsi"
>> +     select BR2_PACKAGE_PCRE
>>       help
>>         NAXSI means Nginx Anti XSS & SQL Injection.
>
>  I may be missing something, but shouldn't there be a _DEPENDENCIES += in .mk?

Nope, this is not needed.
naxsi is a nginx' module, built by nginx.mk, which already has an
automatic dependency on pcre when selected.

Regards,

-- 
Samuel
