From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Dec 2015 16:18:43 +0000
Subject: [Buildroot] [PATCH 3/3] package/boost: add library coroutine2
In-Reply-To: <1449849659.1950.13.camel@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
 <1449842279-22712-3-git-send-email-joerg.krause@embedded.rocks>
 <566AE6EA.9040005@imgtec.com> <20151211163013.1c10a143@free-electrons.com>
 <566AED7B.3060206@imgtec.com> <1449848804.1950.7.camel@embedded.rocks>
 <1449849659.1950.13.camel@embedded.rocks>
Message-ID: <566AF763.3030603@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On 11/12/15 16:00, J?rg Krause wrote:
> On Fr, 2015-12-11 at 16:46 +0100, J?rg Krause wrote:
>> Hi Vicente,
>> Hi Thomas,
>>
>> Also, look at the config.hpp in coroutine2:
>>
>>     #if (defined(BOOST_ALL_DYN_LINK) ||
>>     defined(BOOST_COROUTINES2_DYN_LINK) ) && !
>>     defined(BOOST_COROUTINES2_STATIC_LINK)
>>     # if defined(BOOST_COROUTINES2_SOURCE)
>>     #  define BOOST_COROUTINES2_DECL BOOST_SYMBOL_EXPORT
>>     #  define BOOST_COROUTINES2_BUILD_DLL
>>     # else
>>     #  define BOOST_COROUTINES2_DECL BOOST_SYMBOL_IMPORT
>>     # endif
>>     #endif
>>
>>     #if ! defined(BOOST_COROUTINES2_DECL)
>>     # define BOOST_COROUTINES2_DECL
>>     #endif
>>
>>     #if ! defined(BOOST_COROUTINES2_SOURCE) && !
>>     defined(BOOST_ALL_NO_LIB) && ! defined(BOOST_COROUTINES2_NO_LIB)
>>     # define BOOST_LIB_NAME boost_coroutine
>>     # if defined(BOOST_ALL_DYN_LINK) ||
>>     defined(BOOST_COROUTINES2_DYN_LINK)
>>     #  define BOOST_DYN_LINK
>>     # endif
>>     # include <boost/config/auto_link.hpp>
>>     #endif
>>
>> For coroutine a library name is defined, for coroutine2 not.
> 
> Sorry, I got this wrong.
> 
> What I really meant is that there would be no library name
> boost_coroutine2, but one named boost_coroutine, but only in case it is
> built. Since coroutine2 is just a bunch of header files as Thomas
> explained, no shared library named boost_coroutine is built at all.
> 
> J?rg
> 

understood, thanks for the clarification. Here you have my...

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

$ find output/staging/usr/include/boost/coroutine2/ -type f
output/staging/usr/include/boost/coroutine2/detail/pull_coroutine.ipp
output/staging/usr/include/boost/coroutine2/detail/pull_control_block.hpp
output/staging/usr/include/boost/coroutine2/detail/push_control_block.hpp
...

Regards,

Vincent.
