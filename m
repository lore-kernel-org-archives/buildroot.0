From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 08:50:47 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
In-Reply-To: <ddefae5d-0639-ac78-10c2-bca79dd136a0@mind.be>
References: <20171108121143.5411-1-aduskett@gmail.com>
 <20171123225155.73a4da45@windsurf.lan>
 <9d7c2e3e-7bad-128b-a915-d0f73f3c126c@mind.be>
 <20171123232952.3defa400@windsurf.lan>
 <ddefae5d-0639-ac78-10c2-bca79dd136a0@mind.be>
Message-ID: <20171124085047.5b9195f8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Nov 2017 23:39:57 +0100, Arnout Vandecappelle wrote:
> On 23-11-17 23:29, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Thu, 23 Nov 2017 23:27:18 +0100, Arnout Vandecappelle wrote:
> >   
> >>> Arnout, Peter, Yann, I think we discussed this topic during the
> >>> Buildroot meeting, and concluded we didn't want patches in Buildroot to
> >>> enable LibreSSL compatibility with a package. Do we stand on this
> >>> position, and reject Adam's contribution on ntp?    
> >>
> >>  I don't think the conclusion was that we would reject patches to enable
> >> LibreSSL compatibility outright, only:
> >>  
> >>>     
> >>>> + #ifndef OPENSSL_VERSION_NUMBER
> >>>> ++#ifndef LIBRESSL_VERSION_NUMBER    
> >>>
> >>> In addition, this continue to use the LIBRESSL_VERSION_NUMBER approach,
> >>> which will fail when libressl gains support for new APIs.    
> >>
> >>  we would reject this approach because I believe it is not upstreamable.
> >>
> >>  I think upstreamable patches are acceptable. And maybe even the
> >> LIBRESSL_VERSION_NUMBER approach is OK - but then I first want to see a reliable
> >> upstream accept it.  
> > 
> > The issue here is that Adam has submitted the patch upstream a while
> > ago (see bugs.ntp.org/show_bug.cgi?id=3401#c3), and upstream has
> > reacted.  
> 
>  Maybe I missed something, but I don't see the reaction?

It was too late when I replied to you. I obviously wanted to say:
"upstream has *not* reacted". I.e, your request to "see a reliable
upstream accept it" is hard to achieve, because even if Adam did the
effort of submitting the patch upstream, there was no reaction, either
positive or negative.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
