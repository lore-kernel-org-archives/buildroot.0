From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Oct 2013 11:21:22 -0300
Subject: [Buildroot] [PATCH 5/5] thrift: new package
In-Reply-To: <OF50AC6C4A.47FC76CF-ON86257C12.004BD3EC-86257C12.004DEECE@rockwellcollins.com>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
 <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
 <526B8FEC.2000607@zacarias.com.ar> <526E1146.2070902@mind.be>
 <526E4446.1090806@zacarias.com.ar>
 <OF50AC6C4A.47FC76CF-ON86257C12.004BD3EC-86257C12.004DEECE@rockwellcollins.com>
Message-ID: <526E72E2.3030507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2013 11:11 AM, Ryan Barnett wrote:

>>>  That it's implicit from openssl is not really relevant - if the
>>> dependency is ever removed from openssl (OK, this will not happen, but
>>> just imagine) then we'd like to keep the correct dependency here.
>>
>> Ok.
>> All the packages that use openssl should be checked though, almost none
>> of them do zlib either (doesn't mean they use it directly, but a good
>> check wouldn't hurt).
> 
> I guess all I really care about is a comment in regards to zlib being 
> built from having dependancy on openssl. I don't always remember these 
> things so just a friendly reminder comment is good enough.

Point is thrift has a hard dependency on zlib right now (regardless of
openssl, for channel compression) so it is a dependency.
It can be built without it and loose the TZlibTransport but really it's
already pulled in by openssl so making it optional is kind of pointless.
What should be checked is the same holding true for other packages that
do use openssl and _maybe_ use zlib as well in a separate fashion which
haven't accounted for it (like thrift).
So the comment itself wouldn't apply, pulling in zlib does (select +
DEPENDENCIES) which is what i'm doing for the next patchset version.
Regards.
