From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 25 Nov 2019 12:41:55 +0000
Subject: [Buildroot] [PATCH] pkgconf: Always keep system libs
In-Reply-To: <20191124194218.024c82cf@gmx.net>
References: <20191121183659.1804967-1-thomas.preston@codethink.co.uk>
 <20191124194218.024c82cf@gmx.net>
Message-ID: <a0c71c8b-82dc-6c6a-c169-b298d3d8d825@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On 24/11/2019 18:42, Peter Seiderer wrote:
> Hello Thomas,
> 
> On Thu, 21 Nov 2019 18:36:59 +0000, Thomas Preston <thomas.preston@codethink.co.uk> wrote:
> 
>> Normally pkgconf ignores the system include and system lib directories,
>> which is useful because it allows the correct ordering of -I, -isystem
>> and compiler default search paths. However, many packages use libtool,
>> which relies on pkgconf to print the system libs dirs in order to locate
>> the Libtool Archive (.la) files.
>>
>> Instead of adding PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 to each of these
>> packages, just allow system libs globally in the pkg-config wrapper.
>> This allows libtool to find the .la files, and retains the correct
>> include ordering.
>>
>> Fixes (at least):
>> - http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4/
>> - http://autobuild.buildroot.net/results/089/08952dbf89bf3c49da7697943441cee411940420/
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> 
> In favour of a general pgkconf solution (instead fixing individual packages) and
> tested for the libv4l and gmpc cases, you can add my
> 
> Tested-by: Peter Seiderer <ps.report@gmx.net>
> 
> Only nitpick for the subject line s/Always/always/...
> 

Thanks for testing and reviewing Peter, I've sent a v2.
