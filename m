From: Hartley Sweeten <HartleyS@visionengravers.com>
Date: Wed, 8 Jan 2014 17:05:44 +0000
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <20140108113404.413a4685@skate>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
 <20140108113404.413a4685@skate>
Message-ID: <DC148C5AA1CEBA4E87973D432B1C2D8817E69053@P3PWEX4MB008.ex4.secureserver.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, January 07, 2014 8:34 PM, Thomas Petazzoni wrote:
> On Wed, 8 Jan 2014 00:10:29 +0000, Hartley Sweeten wrote:
>> I'm trying to find a simple GUI library that can be used with SDL and this one appears
>> to cover my needs. Unfortunately the ParaGUI library appears to be a bit dead. The
>> latest release at http://download.savannah.gnu.org/releases/paragui/ is
>> 
>> paragui-1.1.8.tar.gz	19-Oct-2004
>> 
>> I found a newer branch on https://github.com/pipelka/paragui that appears to be
>> version 1.1.11.
>
> My first reaction is: do you really want to start using something that
> appears to be dead/deprecated?

Not really.. But, I have not been able to find anything else that fits my needs.

>> Makefile.am: error: required file './NEWS' not found
>> Makefile.am: error: required file './ChangeLog' not found
>
> These seems to be the real problems. Easiest solution is to add a post
> patch hook with "touch $(@D)/NEWS $(@D)/ChangeLog"
>
> A cleaner solution is to add the "foreign" option in the
> AM_INIT_AUTOMAKE call in configure.in, like:
>
> AM_INIT_AUTOMAKE([1.10 no-define foreign])

I was able to get it to compile under Buildroot yesterday. Now I just need to
figure out what I did to make it work...

One issue I had was:

aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'

The only way I could make this go away was by renaming the configure.in files.
Is this warning normal? I don't remember seeing it with any other packages in
Buildroot.

Thanks,
Hartley
