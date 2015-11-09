From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2015 23:14:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
In-Reply-To: <20151103225311.22589f69@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 3 Nov 2015 22:53:11 +0100")
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
 <20151103225311.22589f69@free-electrons.com>
Message-ID: <87fv0estw5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Gabe Evans,
 > On Tue, 3 Nov 2015 13:17:05 -0800, Gabe Evans wrote:

 >> This patch results in dropbear being broken out-of-the-box for systemd
 >> users. The EnvironmentFile= line sets a requirement that
 >> /etc/default/dropbear exist (it doesn't, by default).
 >> 
 >> I'm not so sure having an environment file by default is a good practice
 >> for systemd units. The general consensus is that things effecting the
 >> execution of a service should always be found in the appropriate service
 >> unit. Environment= would be better anyway since there's only one variable
 >> ($DROPBEAR_ARGS) being used in this particular case.

 > Right. I'll revert the patch from Cyril then, unless he suggests a
 > better solution. I really don't know much about systemd, so I can only
 > rely on people reviewing patches touching systemd topics. If no-one
 > does, all I can do is a guess that the change looks somewhat reasonable.

I have instead changed it to use =- as suggested by Maxime and Steven
and fixed a similar issue with out dhcp package.

-- 
Bye, Peter Korsgaard
