From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 02 May 2015 09:18:58 -0300
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
In-Reply-To: <5544BFEE.5020603@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <5543FCCE.2000904@mind.be> <55440789.50004@je-eigen-domein.nl>
 <55448176.6050108@mind.be> <5544BFEE.5020603@je-eigen-domein.nl>
Message-ID: <5544C0B2.2010107@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2015 09:15 AM, Floris Bos wrote:

> I do know Debian has a patch to let PHP use the system's timezone
> database instead of the internal one.
> We could borrow that one, but then we would be deviating from upstream
> (which did not want the patch, and prefers to stick with their internal
> db).

As far as i remember it's a chicken-and-egg problem.
PHP is used in many old distros/systems that don't have modern tzdata
and that was a problem, so they bundled it (also cross-operating system
consistent behaviour).
But then the bundled one might be out of date as well, and takes up space :)
IMHO it should be a build-time php option.
Regards.
