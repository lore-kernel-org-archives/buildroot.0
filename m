From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Sep 2013 13:41:44 -0300
Subject: [Buildroot] [PATCH 1/2] downloads: add basic CVS support
In-Reply-To: <20130904182446.22d09a4a@skate>
References: <1378310023-6405-1-git-send-email-gustavo@zacarias.com.ar>
 <20130904182446.22d09a4a@skate>
Message-ID: <522762C8.5090104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2013 01:24 PM, Thomas Petazzoni wrote:

>> The support is for pserver mode anonymous CVS.
>> source-check is based on login since many servers don't support or have
>> ls/rls disabled.
>>
>> Usage is pretty straightforward.
>> PKG_SITE defines the site hostname and remote directory.
>> The module is defined by the bare package name.
>> Version is date based.
> 
> Those details should probably go into an update of
> docs/manual/adding-packages-generic.txt, which documents all the source
> methods.

Yes, that'll follow once the method is accepted as proposed, docs aren't
easy to modify if there's substantial change.

> Not related to your change, but interesting to see that LOCALFILES is a
> SCM :)

Well, if someone wants RCS that might be syntactically correct, not for
now though ;)

> Maybe we could replace this with SOURCE_CHECK_*

> and similar here :-)

Sure, i can follow up with the docs patchset.

> This line is quite long. Split it maybe?

True, DOWNLOAD_GIT also exceeds the 80 column "standard", and so do
other parts so don't blame me :)
I also do on SOURCE_CHECK_CVS but that's hardly splittable in a
coherent/useful way, and cvs is very picky with parameter order to
rephrase it.

Regards.
