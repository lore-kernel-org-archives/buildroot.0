From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:46:06 +0100
Subject: [Buildroot] [PATCH] python-config.sh: don't reassign ${prefix}
In-Reply-To: <CANQCQpZz7emu-ZnQyo0v1KQgmo7Md+zfhDBjhvzqj_yQ9Tu6AQ@mail.gmail.com>
References: <20171018165523.13145-1-matthew.weber@rockwellcollins.com>
 <CANQCQpZz7emu-ZnQyo0v1KQgmo7Md+zfhDBjhvzqj_yQ9Tu6AQ@mail.gmail.com>
Message-ID: <046ace6d-ebe5-a939-7747-bce18543d08a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-10-17 15:19, Matthew Weber wrote:
> All,
> 
> On Wed, Oct 18, 2017 at 11:55 AM, Matt Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> When prefix is set to a path like /usr during crossbuild
>> the sed operations end up executing twice, once for the prefix
>> reassignment and another for includedir if it is set as a string
>> including the ${prefix} variable.  This results in an issue
>> when building on a machine that mounts local storage under /usr.
>>
>> This patch updates the remaining location which uses the prefix
>> variable to also sed and update to use the real path.
>>
>> Upstream bug report:
>> https://bugs.python.org/issue31713
>>
>> Buildroot bug:
>> https://bugs.busybox.net/show_bug.cgi?id=10361
>>
>> Fixes failures like the following:
>> python-gobject-2.28.6 | NOK |
>> http://autobuild.buildroot.net/results/ac6cf59125ba57402f926e6c65ffe19e065001b5
>> dbus-python-1.2.4 | NOK |
>> http://autobuild.buildroot.net/results/0d1459155ab6ad2e126e0845ecf6ba2f9381ec8b
>>
> Ping (no urgency on this one, figured I'd bring it back to the top of
> the stack.  Would resolve half a dozen autobr failures a day)
> 
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 Applied to master, thanks. I updated the commit log with an autobuilder
reference that still exists after the crash, and I replaced "on a machine that
mounts local storage under /usr" into "in a subdirectory of /usr".

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
