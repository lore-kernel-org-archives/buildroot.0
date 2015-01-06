From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 15:22:18 +0000
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABFCEE.8020807@zacarias.com.ar>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>	<54ABC247.9030500@zacarias.com.ar>
 <20150106144530.6571a518@free-electrons.com>
 <54ABE7BA.4060005@zacarias.com.ar> <54ABE93B.3080506@imgtec.com>
 <54ABF7D4.8000401@imgtec.com> <54ABFCEE.8020807@zacarias.com.ar>
Message-ID: <54ABFDAA.9030205@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/2015 03:19 PM, Gustavo Zacarias wrote:
> On 01/06/2015 11:57 AM, Vicente Olivert Riera wrote:
> 
>> Hi Thomas, Gustavo,
>>
>> First issue found with automake-1.15. The package libmemcached fails at
>> the configure phase with the following error:
>>
>> configure: error: cannot find install-sh, install.sh, or shtool in "."
>> "./.." "./../.."
>>
>> It works fine using the automake version we have right now in Buildroot.
>>
>> This snippet is included in the configure script if we use
>> automake-1.15, and it fails because is trying to find some files which
>> don't exist in the "." "./.." "./../.." directories:
> 
> Hi.
> That's easy, patch libmemcached-1.0.18/configure.ac and move
> AC_CONFIG_AUX_DIR & AC_CONFIG_MACRO_DIR below AC_PROG_CC and AC_PROG_CXX
> such as:
> 
> -----
> AC_CONFIG_AUX_DIR([build-aux])
> AC_CONFIG_MACRO_DIR([m4])
> 
> # Setup the compilers early on
> AC_PROG_CC([cc gcc clang])
> AC_PROG_CXX([c++ g++ clang++])
> -----
> 
> Regards.
> 
> PS: i want credit for this one! :)
> 

Sorry, but I wrote that patch before you say that solution. The patch is
under review by my company co-workers, that why I haven't send it yet. I
will credit Debian, not you ;-)

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
