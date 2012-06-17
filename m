From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 17 Jun 2012 19:15:17 +0100
Subject: [Buildroot] [PATCH] jquery: allow custom install location
In-Reply-To: <87bokhg7a7.fsf@macbook.be.48ers.dk>
References: <1339681388-13133-1-git-send-email-spdawson@gmail.com>
 <87bokhg7a7.fsf@macbook.be.48ers.dk>
Message-ID: <CAHt8ZCNh0hPr8MwDU3W997uFfaN-26o2HEU2Vz9vVpp+2Qzk6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> What's the use case for this? If we need it, wouldn't it then make more
> sense to have a BR-wide setting for this instead of for each webrelated
> package?

Installing JavaScript files into the hard-coded /var/www directory
isn't always appropriate. For example, I am working on a project at
the moment where /var is mounted as tmpfs, and I don't want any
persistent data there. It's also not uncommon to structure things so
that JavaScript files are in a subdirectory of the main /www or
/var/www "web root" directory.

Does that make sense?

I totally agree with you about adding a Buildroot-wide configuration
item for this, and probably also a similar configuration item to allow
for a custom css install path.
