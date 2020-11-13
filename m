From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 13 Nov 2020 23:50:46 +0200
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without
 video support
In-Reply-To: <20201112223734.007ff25d@gmx.net>
References: <20201110221629.7011-1-ps.report@gmx.net>
 <87sg9ei86d.fsf@dell.be.48ers.dk> <20201112223734.007ff25d@gmx.net>
Message-ID: <20201113235046.GB184214@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello there!

On Thu, 12 Nov 2020 22:37:34 +0100 Peter Seiderer <ps.report@gmx.net> wrote:
> Hello Peter,
> 
> On Thu, 12 Nov 2020 22:20:26 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
> > >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:  
> > 
> >  > Fixes:
> >  >   - https://bugs.busybox.net/show_bug.cgi?id=13306  
> > 
> >  >       .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?; did you mean ?setBeaconAPIEnabled??
> >  >  page-> settings().setGenericCueAPIEnabled(enabled);
> >  >                                     ^~~~~~~~~~~~~~~~~~~~~~~
> >  >                                     setBeaconAPIEnabled  
> > 
> >  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> > 
> > Committed, thanks. Don't forget to submit the patch upstream.
> > 
> 
> Patch seems upstream already superseded by [1] 'Remove remaining alternative
> preference setting mechanisms from LayoutTests' (removing the code)...

I looked a bit into backporting this patch (and a few dependent ones) into the
stable release branch and it got complicated quickly. I think that it may be
better to have the fix that just uses the ENABLE(VIDEO) guards merged in the
release branch.

I have just created an issue in WebKit's Bugzilla:

  https://bugs.webkit.org/show_bug.cgi?id=218921

and I will have a fix done which will be included in version 2.30.3, which
is to be released soon and will also include security fixes. Maybe we would
prefer to wait until that version is released and update Buildroot to it
before ending the release candidate period. WDYT?

?Adri?n

> [1] https://trac.webkit.org/changeset?reponame=webkit&new=269236%40trunk%2FSource%2FWebKit%2FWebProcess%2FInjectedBundle%2FInjectedBundle.cpp&old=269111%40trunk%2FSource%2FWebKit%2FWebProcess%2FInjectedBundle%2FInjectedBundle.cpp
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201113/5521474b/attachment.asc>
