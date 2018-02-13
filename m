From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 13 Feb 2018 21:53:09 +0100
Subject: [Buildroot] [PATCH 12/14] size-stats-compare: fix code style
In-Reply-To: <20180213085134.0e2096dc@windsurf.lan>
References: <20180203152413.GK2369@scaer>
 <5a825b5fea220_51963fbb9ca374f047327@ultri3.mail>
 <20180213085134.0e2096dc@windsurf.lan>
Message-ID: <20180213205309.GY9763@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, Feb 13, 2018 at 08:51:34AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 13 Feb 2018 01:28:31 -0200, Ricardo Martincoski wrote:
> 
> > ... This is present in other scripts and I missed that in v1. I plan to use it
> > if you don't oppose to.
> > 
> >     if header[0] != 'File name' or header[1] != 'Package name' or \
> >        header[2] != 'File size' or header[3] != 'Package size':
> >         print(("Input file %s does not contain the expected header. Are you "
> 
> This version looks good to me. The parenthesis around the if condition
> are useless in Python.

That is not completely accurate: the parentheses are not needed for the if, they
are an alternative to providing a line-continuation character. I.e.

    if (expression1 or
        expression2):

is equivalent to:

    if expression1 or \
       expression2:

Some people/groups prefer to avoid line continuation characters by using the
parentheses style.

/Thomas
