From: Gervais, Francois <FGervais@distech-controls.com>
Date: Mon, 18 Feb 2019 18:40:50 +0000
Subject: [Buildroot] console-getty.service: Trying to get instance name in a
 non template unit file
Message-ID: <BL0PR0102MB34127C66F22D61F31FBE970EF3630@BL0PR0102MB3412.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In commit?7684637bf6274fdfde514d3320b1fc686fea5773,?

This line is added in?console-getty.service:

ExecStart=-/sbin/getty -L %I 115200 vt100

I believe getting the instance name cannot be retrieved as?console-getty.service is not a template.
In my tests, this simply resolves to "".

Would you agree this needs to be changed to the following?

ExecStart=-/sbin/getty -L console 115200 vt100
