From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 20 Jun 2019 12:44:57 +0200
Subject: [Buildroot] [PATCH 2/3] package/busybox: convert S10mdev to the
 canonical init script format
In-Reply-To: <20190620101028.GS9224@smile.fi.intel.com>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190619164257.183607-3-titouan.christophe@railnova.eu>
 <20190620101028.GS9224@smile.fi.intel.com>
Message-ID: <7b16986f-60ed-c07a-5399-7550354086ec@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andy,

On 6/20/19 12:10 PM, Andy Shevchenko wrote:
> On Wed, Jun 19, 2019 at 06:42:56PM +0200, Titouan Christophe wrote:
>> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> 
>> -	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
>> -	    xargs -0 modprobe -abq
> 
>> +	find /sys/ -name modalias -print0 | \
>> +		xargs -0 sort -u | \
>> +		tr '\n' '\0' | \
>> +		xargs -0 modprobe -abq
> 
> How this indentation change related to the topic?
> 

This is a preparatory patch to convert this script to the canonical init 
script format, as suggested by Arnout (see 
http://lists.busybox.net/pipermail/buildroot/2019-May/251199.html)

Regards,

Titouan
