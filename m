From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Aug 2014 08:18:54 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140826092929.6787535b@free-electrons.com>
References: <20140826063010.01540101541@stock.ovh.net>
 <20140826092929.6787535b@free-electrons.com>
Message-ID: <53FC6D1E.1060104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/2014 04:29 AM, Thomas Petazzoni wrote:

>>    powerpc |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4510fe02ef3497803ed27bf339dca07b3b073c10/
> 
> src/thrift/async/TEvhttpServer.cpp: In constructor 'apache::thrift::async::TEvhttpServer::RequestContext::RequestContext(evhttp_request*)':
> src/thrift/async/TEvhttpServer.cpp:102:59: error: 'EVBUFFER_DATA' was not declared in this scope
> src/thrift/async/TEvhttpServer.cpp:102:117: error: 'EVBUFFER_LENGTH' was not declared in this scope
> src/thrift/async/TEvhttpServer.cpp: In member function 'void apache::thrift::async::TEvhttpServer::complete(apache::thrift::async::TEvhttpServer::RequestContext*, bool)':
> src/thrift/async/TEvhttpServer.cpp:142:39: error: 'evbuffer_new' was not declared in this scope
> src/thrift/async/TEvhttpServer.cpp:150:41: error: 'evbuffer_add' was not declared in this scope
> src/thrift/async/TEvhttpServer.cpp:159:22: error: 'evbuffer_free' was not declared in this scope
> make[5]: *** [libthriftnb_la-TEvhttpServer.lo] Error 1
> 
> Gustavo, maybe?

Hi.
It's a conflict between libev and libevent at work here, they both
install /usr/include/event.h hence causing issues.
Isn't that sweet?
I think i've got a solution, i'll send a patch shortly if it pans out.
Regards.
