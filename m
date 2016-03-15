From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 23:08:11 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
In-Reply-To: <20160314230503.0eab7efe@free-electrons.com>
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
 <56E5E786.1090906@mind.be>
 <4mfjrcxqge.ln2@ID-313208.user.individual.net>
 <20160314230503.0eab7efe@free-electrons.com>
Message-ID: <20160315220811.GL5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Thomas, All,

On 2016-03-14 23:05 +0100, Thomas Petazzoni spake thusly:
> On Mon, 14 Mar 2016 20:23:16 +0100, Bernd Kuhls wrote:
> > with my proposed patch we can lower it to BR2_HOST_GCC_AT_LEAST_4_6 ;)
> > 
> > With gcc 4.4 (testing with Ubuntu 10.04.4) adding -std=c++0xwill not be 
> > enough:
> > 
> > XBTFWriter.cpp: In constructor ?CXBTFWriter::CXBTFWriter(const 
> > std::string&)?:
> > XBTFWriter.cpp:42: error: ?nullptr? was not declared in this scope
> > 
> > Looking around for approaches to solve the problem I found these two 
> > commits:
> > 
> > https://hg.mozilla.org/integration/mozilla-inbound/rev/ae45a2c9d678
> > https://github.com/grpc/grpc/
> > commit/3ff350cf96676f2c32c6913aceeabf84a15f3715
> 
> Why do you want to solve the problem? Adding a dependency on
> BR2_HOST_GCC_AT_LEAST_4_6 is perfectly fine, especially for such
> a modern, complex C++ software like Kodi.

Totally agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
