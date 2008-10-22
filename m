From: John Schimandle <john_schimandle@hotmail.com>
Date: Wed, 22 Oct 2008 08:14:23 -0700
Subject: [Buildroot] docs/buildroot.html - package make file makecommand
	overrides configure script CC setting
In-Reply-To: <20081022123821.GA25329@mx.loc>
References: <002401c9343a$7b4fe1b0$6901a8c0@iguana3>
	<20081022123821.GA25329@mx.loc>
Message-ID: <COL0-DAV40905388D37750AE82A10A8D290@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sounds good. I'll submit some changes to the doc.

Might as well update the documentation the best I can since I'm going
through this learning curve on buildroot. That way other newbies can get a
faster start. 

-----Original Message-----
From: Bernhard Reutner-Fischer [mailto:rep.dot.nop at gmail.com] 
Sent: Wednesday, October 22, 2008 5:38 AM
To: John Schimandle
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] docs/buildroot.html - package make file makecommand
overrides configure script CC setting

On Wed, Oct 22, 2008 at 04:36:53AM -0700, John Schimandle wrote:
>I've been stumbling through adding a package to buildroot. Although I 
>did make a successful package I did find a potential problem with the 
>documenation, buildroot usage and documentation document at 
>docs/buildroot.html specifically the section entitled "Extending 
>Buildroot with more software". This section describes the package make 
>file in package/name/name.mk. It shows an example of the file which I 
>think is incorrect. Lines 33 and 34 specify a make statement that 
>overrides the variable settings of CC that are set in configure. The 
>overriding action causes all makes within the package to have the CC 
>variable set to TARGET_CC and not the CC variable defined in the 
>configure script. The CC variable in the configure script is set by 
>TARGET_CONFIGURE_OPTS on line 22 of this example. TARGET_CONFIGURE_OPTS 
>contains architecture specific information for the compiler which is
important for some packages.
> 
>Original statement in example
> 
>33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
>34          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
> 
>I think the example should have the following statements (line 33 is
>unchanged)
> 
>33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
>34          $(MAKE) -C $(FOO_DIR)

yes. I suggest you look at how often these documentation receives updates,
compared to the "code" itself..
> 
>Now the targets see the full CC arguments that were passed to the 
>configure script and were written into each Makefile in the package.
> 
>I don't know if this would be valid for all packages but it seems to me 
>that

This example should only be used for packages which do not use autotools
(autoconf / automake etc). These packages should use
package/Makefile.autotools.in and _not_ this oldish example code.

>you would want to preserve the CC variable setting that was done with 
>the configure script.
> 
>Again, I'm not sure how to submit this change to the buildroot tree.

"
Changes can be submitted for inclusion by posting them to the buildroot
mailing list or to the Bug and Patch Tracking System.
"
(from the webpage)
