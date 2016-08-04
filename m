From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2016 01:12:04 -0700
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <9e817dxthf.ln2@ID-313208.user.individual.net>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
 <9e817dxthf.ln2@ID-313208.user.individual.net>
Message-ID: <7AB7780B-161E-4AE5-A468-EB674A548BE8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 31, 2016, at 5:44 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
>>> 
>>>         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/8907e367345ac8ec16f118eb550810b4e758f0c3/
>> 
>> xsid.cpp:101:1: error: narrowing conversion of ''\200'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> };
>> ^
>> xsid.cpp:101:1: error: narrowing conversion of ''\224'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> xsid.cpp:101:1: error: narrowing conversion of ''\251'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> xsid.cpp:101:1: error: narrowing conversion of ''\274'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> xsid.cpp:101:1: error: narrowing conversion of ''\316'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> xsid.cpp:101:1: error: narrowing conversion of ''\341'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> xsid.cpp:101:1: error: narrowing conversion of ''\362'' from 'char' to 'int8_t {aka signed char}' inside { } [-Wnarrowing]
>> 
>> Bernd, this is your package.
> 
> Need to investigate more, but I am unsure whether I can fix
> the bug with my limited C++ skills.
> 
>> 

you might typecast it. something like

static_cast<int8_t>(?)

or change the type to be int8_t instead of plain char.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160804/bb438a3f/attachment.asc>
