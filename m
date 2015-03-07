From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 13:14:14 +0100
Subject: [Buildroot] [PATCH 2/2] tcl: rename BR2_PACKAGE_TCL_SHLIB_ONLY
 to be more consistent
In-Reply-To: <20150306234239.00ede664@free-electrons.com>
References: <1425681022-16612-1-git-send-email-Vincent.Riera@imgtec.com>	<1425681022-16612-2-git-send-email-Vincent.Riera@imgtec.com>
 <20150306234239.00ede664@free-electrons.com>
Message-ID: <54FAEB96.1090109@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 06/03/15 23:42, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 6 Mar 2015 22:30:22 +0000, Vicente Olivert Riera wrote:
>> The BR2_PACKAGE_TCL_SHLIB_ONLY is confusing because someone could think
>> that only shared libraries would be installed. But, what actually does
>> is removing the 'tclsh' binary, so better to reword it in order to be
>> consistent with what actually does.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/tcl/Config.in |    7 +++----
>>  package/tcl/tcl.mk    |    2 +-
>>  2 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/tcl/Config.in b/package/tcl/Config.in
>> index c3d0d87..996dc96 100644
>> --- a/package/tcl/Config.in
>> +++ b/package/tcl/Config.in
>> @@ -25,12 +25,11 @@ config BR2_PACKAGE_TCL_DEL_ENCODINGS
>>  
>>  	  It saves approx. 1.6 Mb of space.
>>  
>> -config BR2_PACKAGE_TCL_SHLIB_ONLY
>> -	bool "install only shared library"
>> +config BR2_PACKAGE_TCL_REMOVE_TCLSH
> 
> Renaming options requires Config.in.legacy handling.

ooops!!! You are right, sorry. I will send a v2. Thanks!

--
Vincent

> Thomas
> 
