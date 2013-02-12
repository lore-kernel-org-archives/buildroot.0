From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 15:21:55 +0100
Subject: [Buildroot] [PATCH v2] Python 3, simple,
 external package support
In-Reply-To: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
References: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130212152155.0d3c5301@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

On Tue, 12 Feb 2013 15:13:56 +0100, Patrick Gerber wrote:
> This patch series refactor python support in buildroot to enable the use of
> from line 'This patch series refactor python support in buildroot to enable
> the use of external package with both python2 and python3. The packages 
> python-bottle and python-serial have adapted as examples.
> 
> To support others external package more work is needed as they are based on
> python setuptools. It's no more supported by python3 and should be replaced
> by "Distribute". This should be done in another patch series.

Thanks, but it still doesn't answer the question:

"""
As Samuel pointed it out, this unfortunately may break a number of
things in Buildroot. They are packages that depend on host-python, and
would only be capable of using an Python 2.x host-python.

Or at least, I would like to have the confirmation that all packages
that depend on host-python continue to build normally when host-python
is Python 3.

That said, some packages are not really clear about this. For example,
Scons uses the Python provided with the distribution, and not the
host-python built by Buildroot.

As you can see, this is not a trivial topic.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
