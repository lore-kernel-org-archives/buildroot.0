From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 30 Dec 2010 22:24:36 +0100
Subject: [Buildroot] commiting patches
In-Reply-To: <AANLkTingc4f9wGxik=8Y+FuAzZaeH240ouExDr+sgVHb@mail.gmail.com>
References: <20101230063005.15755osot9w5qwco@www.home.zuerker.org>
	<8739pfhtgk.fsf@macbook.be.48ers.dk>
	<AANLkTingc4f9wGxik=8Y+FuAzZaeH240ouExDr+sgVHb@mail.gmail.com>
Message-ID: <20101230212436.GA13863@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 30, 2010 at 10:04:13PM +0100, Daniel Nystr?m wrote:
> 2010/12/30 Peter Korsgaard <jacmet@uclibc.org>:
> > It's a big help when other developers help with the review and send
> > their ack/nacks (thanks for this!), so those patches are often handled
> > earlier than others.
> 
> How do you prefer the ack/nack? Just a reply with "+1" in mail body? A
> "Signed-off-by: name <mail>" mail body? or the whole patch resubmitted
> with the SoB-line added?

On linux-kernel the rules are mosre or less:

You provide an ack by including the fomal ack line in a mail like this:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

This makes it easy for the submitter to copy the line and
you have it using your preferred spelling / mail address.
There are people that does not use their regular mail address
the acked-by lines.
Sometimes submittes interprets mails like "+1" as Acked-by: - sometimes not.


You use a sob line only if you are in the chain that _handle_ a patch.
So you can follow the path of the patch by following the sob-lines.

Lets consider a simple example.
I create a patch for which I add my:
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Then you pick it up - and potentially modifying it.
To document that you are in the chain handling the
patch you add your SOB line below mine.
So it would now look like this:

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>

And then Peter picks it up and when he applies it he add his SOB line as well.


So the applied patch will look like this:

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Signed-off-by: Peter Korsgaard <jacmet@uclibc.org>


	Sam
