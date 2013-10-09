From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 9 Oct 2013 14:54:59 -0500
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <525556CE.3000308@lucaceresoli.net>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <CAAXf6LVxoXMaBFVzc6Hd46ST8AwDOyd8PdRfJ04WKfF9po_K9w@mail.gmail.com>
 <525556CE.3000308@lucaceresoli.net>
Message-ID: <OFD86DE493.D2F88486-ON86257BFF.00633E0D-86257BFF.006D67AD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, Thomas D., All,

I also ack on all agreed upon with the following condition (see below)

Luca Ceresoli <luca@lucaceresoli.net> wrote on 10/09/2013 08:14:54 AM:

> Hi Thomas,
> 
> I ack all of your report. Just a few notes below.
> 
> Thomas De Schampheleire wrote:
> > Luca, all,
> >
> > Let's try to summarize/conclude on these items...
> >
> 
> ...
> 
> >> 4. Suppose that a package has no license files and explicitly 
declares
> >> this with FOO_LICENSE_FILES =
> >> In this case, you will still get a warning: "cannot save license
> >> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
> >> I think it would be better to distinghuish the situation 'empty' and
> >> 'not defined'.
> >
> > Reading the various comments I have the impression there is a
> > consensus to define a magic value for FOO_LICENSE_FILES, correct. The
> > question is: which value(s). If we want to differentiate between:
> > a. there is a license, it has a license text, but the text is not
> > provided with the sources, and
> > b. there is a license but there doesn't exist any license text,
> > then we need two magic values.
> >
> > There were a few suggestions:
> > N/A, none, NONE (ThomasP), which would cover (b)
> > missing (rejected by ThomasP), not-provided, none-provided (ThomasDS),
> > which would cover (a)
> 
> (a) is for cases when we are unable to extract the text, so what about 
> "not-extracted"?
> 
> >
> >
> > In case of (a), I'm not sure if a warning is needed. It could for
> > example be that the license is 'public domain' which doesn't need a
> > license text.
> > For (b) I think a warning is a good idea.
> >
> >
> >
> > Related to this is the question of a license URL. I personally think
> > it is not legally safe to only refer to a URL from a package, because
> > who knows someone changes the license text on the URL. They could just
> > alter the license of existing sources.
> > So although the feature of automatically downloading a license text
> > from its URL looks nice, I (not a lawyer) would not recommend
> > implementing it. I follow ThomasP's reasoning of requesting upstream
> > to add the effective license text to the sources, and in the meantime
> > using the magic value decided above for case (b).
> 
> I agree with you. Regarding the legal stuff we should stay on the safe 
> side. But Arnout and Simon expressed an opposite opinion on another 
> branch of this thread...

I would like to see that document under the "Legal notice and licensing"
be updated to reflect what was said in this discussion. Specifically
what to do when license isn't proved.

> -- 
> Luca

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131009/7a084a82/attachment.html>
