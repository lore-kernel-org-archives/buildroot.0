From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Feb 2015 19:45:33 +0100
Subject: [Buildroot] TZ_LOCALTIME cannot be empty for gtk#
Message-ID: <CA+TH9VmdyyX+MLT56rcogu7tBqtg1rrru2hxyS+fQbO8hh8LMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I'm building gtk# (new package) and encountered a little and annoying problem.

If tz localtime is not setup (/etc/localtime and /etc/timezone), gtk#
crashes bacause timezone cannot be null.

Having a timezone is a good practice, but I noticed that buildroot
doesn't enforce that: when TZ_LOCALTIME is empty the timezone is
simply not set up, thus relying on correct implementations in user
code.

I wrote a dirty patch that sets TZ_LOCALTIME to Etc/UTC if empty, so
the timezone is correctly configured making gtk# happy.

I ask an advice on how to solve this problem the right way to have the
patches included.

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
